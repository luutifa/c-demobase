#ifndef SCENE_H
#define SCENE_H

struct demo_t;

int scene_init(const demo_t*);
void scene_free();
void scene_render();

#endif
