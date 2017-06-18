#include "write_fb.h"
/** fb_write_cell:
 * Each framebuffer cell:
 * Bit:     | 15 14 13 12 11 10 9 8 | 7 6 5 4 | 3 2 1 0 |
 * Content: | ASCII                 | FG      | BG      |
 *  Writes a character with the given foreground and background to position i
 *  in the framebuffer.
 *
 *  @param i  The location in the framebuffer
 *  @param c  The character
 *  @param fg The foreground color
 *  @param bg The background color
 */
char* fb = (char*) 0x000B8000;

void fb_write_cell(unsigned int i, char c, unsigned char fg, unsigned char bg)
{
	fb[i*2] = c;
	fb[i*2 + 1] = ((fg & 0x0F) << 4) | (bg & 0x0F);
}
