# Dev Log

### Working Features
- A stack of Bodys that interacts with Dirt and falls after Dirt passes.
- Bird, head of the Body stack. If Dirt touches Bird, the game ends.
- Doom class that makes random Body parts disappear.
- Moving Dirt blocks that push Body.
- Start, Game, and End screen.
- Score count with TopScore
- Limits on stack. It cannot grow past a certain number and cannot grow if Bird is underneath a Dirt.

### Broken Features / Bugs
- Different blocks of the body may overlap for a few seconds when there are too many parts going on at the same time. For example, you can keypress while the body is still falling to the ground, new blocks will overlap older ones.
- When Dirt touches a Body block, the Body block will drop according to the yspeed.

### Content, Resources
- Game Square Bird, which our project attempts to emulate.
- https://happycoding.io/tutorials/processing/collision-detection : research for how collision in processing works
