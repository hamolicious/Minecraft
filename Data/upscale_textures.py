import pygame
from os import path, listdir

text_path = 'Textures/'
multiplier = 20
for file in listdir(text_path):
    if not file.endswith('png') : continue

    file = path.join(text_path, file)
    img = pygame.image.load(file)

    w, h = img.get_size()
    if w == 16 * multiplier and h == 16 * multiplier : continue

    img = pygame.transform.scale(img, (w * multiplier, h * multiplier))
    pygame.image.save(img, file)
