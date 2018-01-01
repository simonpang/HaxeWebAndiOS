package draw;

// Interface for abstract canvas view model action handler.
extern interface CanvasModelActionHandling {
    function handleAction(action: CanvasModelAction): Void;
}
