package draw;

import js.Browser;

class Main {
    static function main() {
    	var viewController = new MainViewController();
        Browser.document.body.appendChild(viewController.element);
        viewController.viewDidAppear();
    }
}
