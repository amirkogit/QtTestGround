#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"
#include <myclass.h>
#include <camera.h>

TEST_CASE( "MyMath", "[mymath]" ) {
    SECTION("Addition") {
        MyClass my;
        REQUIRE(my.addition(3,4) == 7);
    }
    SECTION("Multipication") {
        MyClass my;
        REQUIRE(my.product(3,4) == 12);
    }
}

TEST_CASE("MyCamera","[mycamera]")
{
    SECTION("CenterX") {
        Camera camera;
        REQUIRE(camera.getCenterX() == 10.0);
    }
    SECTION("CenterY") {
        Camera camera;
        REQUIRE(camera.getCenterY() == 20.0);
    }
    SECTION("CenterZ") {
        Camera camera;
        REQUIRE(camera.getCenterZ() == 30.0);
    }
}
