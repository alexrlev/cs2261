// ''GBA Video Registers and Flags
#define REG_DISPCTL (*(unsigned short *)0x4000000)
#define MODE3 3
#define BG2_ENABLE (1<<10)

// Create a color with the specified RGB values
#define COLOR(r, g, b) ((r) | (g)<<5 | (b)<<10)

// Calculate the position of a pixel based on its row and column
#define OFFSET(r, c, rowlen) ((r)*(rowlen)+(c))

// Predefined colors
#define RED COLOR(31, 0, 0)
#define GREEN COLOR(0, 31, 0)
#define BLUE COLOR(0, 0, 31)
#define MAGENTA COLOR(31, 0, 31)
#define CYAN COLOR(0, 31, 31)
#define YELLOW COLOR(31, 31, 0)
#define BLACK 0
#define WHITE COLOR(31, 31, 31)

// Function Prototypes
void setPixel(int, int, unsigned short);
void drawTriangle(int, int);

// Global Variables
unsigned short *videoBuffer = (unsigned short *)0x6000000;

int main() {

    REG_DISPCTL = MODE3 | BG2_ENABLE;

    drawTriangle(50, 60);
    drawTriangle(30, 20);
    drawTriangle(90, 100);

    while(1);
}



void setPixel(int row, int col, unsigned short color) {

	videoBuffer[OFFSET(row, col, 240)] = color;

}

void drawTriangle(int row, int col) {

    int length = 25;

    for (int i = 0; i < length; i++) {
		setPixel(row + i, col, GREEN);
		setPixel(row, col + i, GREEN);
		setPixel((row + length - i), (col + i), GREEN);
	}

}