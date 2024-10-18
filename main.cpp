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
