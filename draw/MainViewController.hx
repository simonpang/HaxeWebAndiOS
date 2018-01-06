package draw;

import js.Browser;

// Main view controller
class MainViewController {

	public var element: js.html.DOMElement;
    var canvas: js.html.CanvasElement;
    var button: js.html.ButtonElement;
    var viewModel: CanvasModel;

	public function new() {
        viewModel = new CanvasModel();
        viewModel.actionHandler = function (action) performAction(action);
        loadView();
    }

    function loadView() {
        element = Browser.document.createDivElement();
        button = Browser.document.createButtonElement();
    	button.textContent = "Clear";
        button.onclick = function(event) clear();
        element.appendChild(button);

        canvas = Browser.document.createCanvasElement();
        canvas.onmousedown = function(e) {
            var x = e.clientX - canvas.offsetLeft;
            var y = e.clientY - canvas.offsetTop;
            viewModel.onEvent(CanvasModelEvent.MouseDown(x, y));
        }
        canvas.onmousemove = function(e) {
            var x = e.clientX - canvas.offsetLeft;
            var y = e.clientY - canvas.offsetTop;
            viewModel.onEvent(CanvasModelEvent.MouseMove(x, y));
        }
        canvas.onmouseup = function(e) {
            var x = e.clientX - canvas.offsetLeft;
            var y = e.clientY - canvas.offsetTop;
            viewModel.onEvent(CanvasModelEvent.MouseUp(x, y));
        }
        element.appendChild(canvas);
	}

    public function viewDidAppear() {
        var context = canvas.getContext2d();
        context.strokeRect(0, 0, 300, 150);
    }

    // Action handling

    public function performAction(action: CanvasModelAction) {
        switch action {
            case ClearAll:
                clear();
            case Redraw:
                redraw();
            case DrawLine(line):
                drawLine(line);
        }
    }

    function clear() {
        var context = canvas.getContext2d();
        context.clearRect(0, 0, 300, 150);
        context.strokeStyle = "#000";
        context.strokeRect(0, 0, 300, 150);
    }

    function redraw() {        
    }

    function drawLine(line: LineItem) {
        var context = canvas.getContext2d();
        context.beginPath();
        context.moveTo(line.x1, line.y1);
        context.lineTo(line.x2, line.y2);
        context.strokeStyle = "#f00";
        context.stroke();
    }
}