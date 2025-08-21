// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SignalController() constructor {

	static __listeners = {};
	
	static add = function(_id, _signal, _callback) {
		
		// check if given signal is yet known
		if (!struct_exists(__listeners, _signal)) {
            __listeners[$ _signal] = [];
        }
		
		var _listeners = __listeners[$ _signal];
		
		// check if listener already exists
		for (var i = 0; i < array_length(_listeners); i++) {
			var _binding = _listeners[i];
			
			if (_binding.listener == _id) {
				
				show_debug_message("Listener " + _id + " already exists for signal " + _signal + ".");
				return;
			}
		}
		
		// add listener to signal
		var _new_binding = new ListenerBinding(_id, _callback);
		array_push(_listeners, _new_binding);
		
	}
	
	static send = function(_signal, _signal_data) {
		
		// check if given signal is yet known
		if (!struct_exists(__listeners, _signal)) {
			
			show_debug_message("Signal " + _signal + " has not been added to controller yet.");
            return;
        }
		
		var _listeners = __listeners[$ _signal];
		
		// check if any listeners have been added for this signal
		if (array_length(_listeners) <= 0) {
			
			show_debug_message("No listeners added to " + _signal + ".");
            return;
		}
		
		// send!!!!!!
		for (var i = 0; i < array_length(_listeners); i++) {
			
			var _binding = _listeners[i];
			var _listener = _binding.listener;
			var _callback = _binding.callback;
			
			with (_listener) {
				_callback(_signal_data);
			}
		}
		
	}
}