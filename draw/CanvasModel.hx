package draw;

// Canvas view model
class CanvasModel {

#if cpp
    var delegate: cpp.Pointer<draw.CanvasModelActionHandler>;

    public function actionHandler(action: CanvasModelAction) {
        trace("a1");
        delegate.value.handleAction(action);
        trace("a2");
    }

#else
    public var actionHandler: CanvasModelAction -> Void;
#end

    // Internal tool states
    var lastX: Int;
    var lastY: Int;
    var isDragging: Bool;

    public function new() {
    }

    public function onEvent(e: CanvasModelEvent) {
        //trace("Handling: ", e);

        switch e {
    	case MouseDown(x, y):
    		lastX = x;
    		lastY = y;
    		isDragging = true;

    	case MouseMove(x, y):
    		if (isDragging) {
    			var line = new LineItem(lastX, lastY, x, y);
    			actionHandler(CanvasModelAction.DrawLine(line));
        		lastX = x;
        		lastY = y;
    		}

    	case MouseUp(x, y):
    		isDragging = false;

    	case ClearButtonPushed:
    		actionHandler(CanvasModelAction.ClearAll);
    	}
    }
}
