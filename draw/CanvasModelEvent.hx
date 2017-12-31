package draw;

// Possible events for canvas view model.
enum CanvasModelEvent {
    MouseDown(x: Int, y: Int);
    MouseMove(x: Int, y: Int);
    MouseUp(x: Int, y: Int);
    ClearButtonPushed;
}
