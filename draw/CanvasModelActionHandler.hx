package draw;

// CanvasModelActionHandler is a wrapper for cpp to implement CanvasModelActionHandling.
class CanvasModelActionHandler implements CanvasModelActionHandling {

	public var handler: cpp.Callable<CanvasModelAction -> Void>;

	public function handleAction(action: CanvasModelAction) {
		handler(action);
	}

	public function new(handler: cpp.Callable<CanvasModelAction -> Void>) {
		this.handler = handler;
	}
}
