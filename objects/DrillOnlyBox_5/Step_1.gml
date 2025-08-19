// logic must be put here instead of in a collide event
// collide events are called AFTER step events
// thus, the step event for physics object will prevent player collision with block
// EVEN IF the block is to be destroyed by the forcefield right after

if (place_meeting(x, y, o_Forcefield)) {
	kill_block();
}