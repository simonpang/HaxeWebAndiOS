package draw;

// Canvas view model
class CanvasModel {

    public var delegate: CanvasModelActionHandling;

    // Internal tool states
    var lastX: Int;
    var lastY: Int;
    var isDragging: Bool;

    public static function sayHi() {
    	trace("say hi!");
    }

    //public function new(actionHandler: CanvasModelActionHandling) {
        //this.delegate = actionHandler;
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
    			delegate.handleAction(CanvasModelAction.DrawLine(line));
        		lastX = x;
        		lastY = y;
    		}

    	case MouseUp(x, y):
    		isDragging = false;

    	case ClearButtonPushed:
    		delegate.handleAction(CanvasModelAction.ClearAll);
    	}
    }
}
