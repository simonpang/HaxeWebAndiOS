//
//  ViewController.m
//  Draw
//
//  Created by Simon Pang on 31/12/2017.
//

#import "ViewController.h"
#include "draw/CanvasModel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Demo calling Haxe
    draw::CanvasModel_obj::sayHi();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
