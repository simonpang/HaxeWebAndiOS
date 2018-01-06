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
//#include "draw/CanvasModelAction.h"
#include "../../draw/CanvasModelActionHandler.h"

class CanvasActionHandlerImpl: draw::CanvasModelActionHandler {

public:
    // Constructor
    CanvasActionHandlerImpl(ViewController *parent) : parent(parent) {};

    void clearAll();
    void redraw();
    void drawLine(int x1, int y1, int x2, int y2);

private:
    ViewController *parent;
};


@interface ViewController () {
    draw::CanvasModel obj;
    CanvasActionHandlerImpl *actionHandlerImpl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    obj = draw::CanvasModel_obj::__new();
    hx::GCAddRoot((hx::Object **) &obj.mPtr);

    actionHandlerImpl = new CanvasActionHandlerImpl(self);
    obj->setDelegate(actionHandlerImpl);
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
    delete actionHandlerImpl;
    hx::GCRemoveRoot((hx::Object **) &obj.mPtr);
}

@end

#pragma mark - CanvasActionHandler Implementation

void CanvasActionHandlerImpl::drawLine(int x1, int y1, int x2, int y2) {

}

void CanvasActionHandlerImpl::redraw() {

}

void CanvasActionHandlerImpl::clearAll() {

}
