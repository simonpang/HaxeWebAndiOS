//
//  ViewController.m
//  Draw
//
//  Created by Simon Pang on 31/12/2017.
//

#import "ViewController.h"
#define HXCPP_API_LEVEL 331
#include "hxcpp.h"
#define _hx_tag ""
#include "draw/CanvasModel.h"
#include "draw/CanvasModelEvent.h"
#include "draw/CanvasModelAction.h"
#include "draw/CanvasModelActionHandler.h"


@interface ViewController () {
    draw::CanvasModel obj;
}

@end

void hello(draw::CanvasModelAction action) {

}

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // References:
    // https://groups.google.com/forum/#!topic/haxelang/dlKAkSuZXSo
    // https://github.com/HaxeFoundation/hxcpp/blob/master/src/hx/cppia/CppiaModule.cpp

    obj = draw::CanvasModel_obj::__new();
    hx::GCAddRoot((hx::Object **) &obj.mPtr);

    auto f = cpp::Function<::draw::CanvasModelAction>(&hello);
    auto handler = draw::CanvasModelActionHandler_obj::__new(f);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    obj->onEvent(draw::CanvasModelEvent_obj::MouseDown((int) location.x, (int) location.y));
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    obj->onEvent(draw::CanvasModelEvent_obj::MouseMove((int) location.x, (int) location.y));
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    obj->onEvent(draw::CanvasModelEvent_obj::MouseUp((int) location.x, (int) location.y));
}

- (void)dealloc
{
    hx::GCRemoveRoot((hx::Object **) &obj.mPtr);
}

@end
