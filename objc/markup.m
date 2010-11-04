#import <Foundation/Foundation.h>

@interface NuOperator : NSObject
{
}

- (id) evalWithArguments:(id) cdr context:(NSMutableDictionary *) context;
- (id) callWithArguments:(id) cdr context:(NSMutableDictionary *) context;
@end

@interface NuMarkupOperator : NuOperator
{
    NSString *tag;
    NSString *prefix;
    id contents;
    BOOL empty;
}

- (id) initWithTag:(NSString *) tag;
- (id) initWithTag:(NSString *) tag prefix:(NSString *) prefix contents:(id) contents;
- (void) setEmpty:(BOOL) e;

@end

@implementation NuMarkupOperator

+ (id) operatorWithTag:(NSString *) _tag
{
    return [[[self alloc] initWithTag:_tag] autorelease];
}

+ (id) operatorWithTag:(NSString *) _tag prefix:(NSString *) _prefix
{
    return [[[self alloc] initWithTag:_tag prefix:_prefix contents:nil] autorelease];
}

+ (id) operatorWithTag:(NSString *) _tag prefix:(NSString *) _prefix contents:(id) _contents
{
    return [[[self alloc] initWithTag:_tag prefix:_prefix contents:_contents] autorelease];
}

- (id) initWithTag:(NSString *) _tag
{
    return [self initWithTag:_tag prefix:nil contents:nil];
}

- (id) initWithTag:(NSString *) _tag prefix:(NSString *) _prefix contents:(id) _contents
{
    self = [super init];
    tag = _tag ? [[_tag stringByReplacingOccurrencesOfString:@"=" withString:@":"] retain] : nil;
    prefix = _prefix ? [_prefix retain] : @"";
    contents = _contents ? [_contents retain] : [NSNull null];
    return self;
}

- (void) setEmpty:(BOOL) e
{
    empty = e;
}

- (id) callWithArguments:(id)cdr context:(NSMutableDictionary *)context
{
    NSMutableString *body = [NSMutableString string];
    NSMutableString *attributes = [NSMutableString string];

    static id NuSymbol = nil;
    if (!NuSymbol) {
        NuSymbol = NSClassFromString(@"NuSymbol");
    }

    for (int i = 0; i < 2; i++) {
        id cursor = (i == 0) ? contents : cdr;
        while (cursor && (cursor != [NSNull null])) {
            id item = [cursor car];
            if ([item isKindOfClass:[NuSymbol class]] && [item isLabel]) {
                cursor = [cursor cdr];
                if (cursor && (cursor != [NSNull null])) {
                    id value = [[cursor car] evalWithContext:context];
                    id attributeName = [[item labelName] stringByReplacingOccurrencesOfString:@"=" withString:@":"];
                    id stringValue = [value isEqual:[NSNull null]] ? @"" : [value stringValue];
                    [attributes appendFormat:@" %@=\"%@\"", attributeName, stringValue];
                }
            }
            else {
                id evaluatedItem = [item evalWithContext:context];
                if (!evaluatedItem || (evaluatedItem == [NSNull null])) {
                    // do nothing
                }
                else if ([evaluatedItem isKindOfClass:[NSString class]]) {
                    [body appendString:evaluatedItem];
                }
                else if ([evaluatedItem isKindOfClass:[NSArray class]]) {
                    int max = [evaluatedItem count];
                    for (int i = 0; i < max; i++) {
                        id objectAtIndex = [evaluatedItem objectAtIndex:i];
                        [body appendString:[objectAtIndex stringValue]];
                    }
                }
                else {
                    [body appendString:[evaluatedItem stringValue]];
                }
            }
            if (cursor && (cursor != [NSNull null]))
                cursor = [cursor cdr];
        }
    }

    if (!tag) {
        return body;
    }
    else if ([body length] || !empty) {
        return [NSString stringWithFormat:@"%@<%@%@>%@</%@>", prefix, tag, attributes, body, tag];
    }
    else {
        return [NSString stringWithFormat:@"%@<%@%@/>", prefix, tag, attributes];
    }
}

- (NSString *) tag {return tag;}
- (NSString *) prefix {return prefix;}
- (id) contents {return contents;}
- (BOOL) empty {return empty;}

@end
