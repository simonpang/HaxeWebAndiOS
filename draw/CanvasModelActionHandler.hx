package draw;

// CanvasModelActionHandler is a wrapper for cpp to implement CanvasModelActionHandling.

@:include('./CanvasModelActionHandler.h')
@:native('draw::CanvasModelActionHandler')
extern class CanvasModelActionHandler {

	@:native 
	function clearAll(): Void;

    @:native 
    function redraw(): Void;

    @:native
    function drawLine(x1: Int, y1: Int, x2: Int, y2: Int): Void;

	inline function handleAction(action: CanvasModelAction): Void {
        switch action {
        case ClearAll:
            clearAll();
        case Redraw:
            redraw();
        case DrawLine(line):
            drawLine(line.x1, line.y1, line.x2, line.y2);
        }
	}
}
