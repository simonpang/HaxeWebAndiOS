
#ifndef CANVS_MODEL_ACTION_HANDLER_INC
#define CANVS_MODEL_ACTION_HANDLER_INC

namespace draw {

	class CanvasModelActionHandler {

	public:

		virtual void clearAll() {};

		virtual void redraw() {};

		virtual void drawLine(int x1, int y1, int x2, int y2) {};
	};
}

#endif
