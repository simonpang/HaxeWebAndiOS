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

class CanvasActionHandlerImpl: draw::CanvasModelActionHandler {

public:
    // Constructor
    CanvasActionHandlerImpl(ViewController *parent) : parent(parent) {};

    virtual void clearAll();
    virtual void redraw();
    virtual void drawLine(int x1, int y1, int x2, int y2);

private:
    ViewController *parent;
};


@interface ViewController () {
    draw::CanvasModel obj;
    CanvasActionHandlerImpl *actionHandlerImpl;
}

@property UIBezierPath *previewPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    obj = draw::CanvasModel_obj::__new();
    hx::GCAddRoot((hx::Object **) &obj.mPtr);

    actionHandlerImpl = new CanvasActionHandlerImpl(self);
    obj->delegate = actionHandlerImpl;

    self.previewPath = [UIBezierPath new];
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = self.previewPath.CGPath;
    [self.view.layer addSublayer:shape];

    actionHandlerImpl->drawLine(0, 0, 0, 0);
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
    [parent.previewPath moveToPoint:CGPointMake(x1, y1)];
    [parent.previewPath addLineToPoint:CGPointMake(x2, y2)];
}

void CanvasActionHandlerImpl::redraw() {

}

void CanvasActionHandlerImpl::clearAll() {

}
