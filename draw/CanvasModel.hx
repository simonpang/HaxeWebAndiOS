package draw;

// Canvas view model
class CanvasModel {

    public var actionHandler: CanvasModelAction -> Void;

#if cpp
    public function setDelegate(handler: cpp.Pointer<draw.CanvasModelActionHandler>) {
        this.actionHandler = function(action) handler.value.handleAction(action);
    }
#end

    // Internal tool states
    var lastX: Int;
    var lastY: Int;
    var isDragging: Bool;

    public static function sayHi() {
    	trace("say hi!");
    }

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
