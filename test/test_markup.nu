;; test_markup.nu
;;  tests for Nu markup operator
;;
;;  Copyright (c) 2010 Tim Burks, Neon Design Technology, Inc.

(load "NuMarkup")

(class TestMarkup is NuTestCase
     
     (- testMarkup is
        (set &html (NuMarkupOperator operatorWithTag:"html" prefix:"<!DOCTYPE html>\n"))
        (set &body (NuMarkupOperator operatorWithTag:"body"))
        
        (assert_equal "<body></body>" (&body))
        (assert_equal "<body></body>" (&body incomplete:))
        (assert_equal "<body attr=\"val\"></body>" (&body attr:"val"))
        (assert_equal "<!DOCTYPE html>\n<html><body this=\"is\" a=\"test\">hello, world</body></html>" (&html (&body this:"is" a:"test" "hello," " world")))
        (assert_equal "<body>abc123</body>" (&body (array "a" "b" "c") 123))
        (assert_equal "<body>12.</body>" (&body "1" (if (eq 1 1) 2) (if (eq 1 2) 3) "."))))
