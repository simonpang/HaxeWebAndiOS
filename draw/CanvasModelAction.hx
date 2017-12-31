package draw;

// Possible actions generated from canvas view model.
enum CanvasModelAction {
    ClearAll;
    Redraw;
    DrawLine(line: LineItem);
}
