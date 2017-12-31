//
//  main.m
//  Draw
//
//  Created by Simon Pang on 31/12/2017.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#include "hxcpp.h"
#include "hx/Native.h"

int main(int argc, char * argv[]) {

    @autoreleasepool {
        HX_TOP_OF_STACK hx::Boot(); __boot_all();
        const char * msg = hx::Init();
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
