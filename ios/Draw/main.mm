//
//  main.m
//  Draw
//
//  Created by Simon Pang on 31/12/2017.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

extern "C" const char *hxRunLibrary();
extern "C" void hxcpp_set_top_of_stack();

int main(int argc, char * argv[]) {

    hxcpp_set_top_of_stack();

    const char *err = hxRunLibrary();
    if (err) {
        // Unhandled exceptions ...
        fprintf(stderr,"Error %s\n", err );
        return -1;
    }


    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
