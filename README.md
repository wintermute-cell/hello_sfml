# A very simple SFML starter (using cmake)

This is a basic example for `SFML` similar to what `raylib` provides on their
`README.md`. It creates a window and draws the text `"Congrats! You created your
first SFML window!"` in the middle of the screen.

```cpp
#include <iostream>
#include "SFML/Graphics.hpp"

int main() {
    sf::RenderWindow window(sf::VideoMode(800, 450), "sfml example - basic window!", sf::Style::Close);

    sf::Font font;
    if (!font.loadFromFile("arial.ttf")) {
        std::cerr << "Error loading font!" << std::endl;
        return 1;
    }
    sf::Text myMessage("Congrats! You created your first SFML window!", font, 20);
    myMessage.setPosition(190, 200);

    while (window.isOpen()) {
        sf::Event event;
        while (window.pollEvent(event)) {
            if (event.type == sf::Event::Closed) window.close();
            if (event.type == sf::Event::KeyPressed)
                if (event.key.code == sf::Keyboard::Escape) window.close();
        }

        window.clear();
        window.draw(myMessage);
        window.display();
    }

    return 0;
}
```

## Compiling and running

Using the `cmake` workflow to compile is optional, you only need to properly
link to `sfml`.

```bash
mkdir build && cd build
cmake ..
make && ./hello_sfml
```
