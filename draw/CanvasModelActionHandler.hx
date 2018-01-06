package draw;

// CanvasModelActionHandler is a wrapper for cpp to implement CanvasModelActionHandling.

@:include('./CanvasModelActionHandler.h')
@:native('draw::CanvasModelActionHandler')
@:structAccess
extern class CanvasModelActionHandler {

	@:native 
	function clearAll(): Void;

    @:native 
    function redraw(): Void;

    @:native
    function drawLine(x1: Int, y1: Int, x2: Int, y2: Int): Void;

	inline function handleAction(action: CanvasModelAction): Void {
        trace("b");
        switch action {
        case ClearAll:
        trace("c");
            clearAll();
        case Redraw:
        trace("d");
            redraw();
        case DrawLine(line):
        trace("e");
            drawLine(line.x1, line.y1, line.x2, line.y2);
        }
        trace("f");
	}
}
