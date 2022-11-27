package main

import "github.com/gofiber/fiber/v2"

func main() {
	app := fiber.New()

	app.Static("/", "./public")

	app.Get("/*", func(c *fiber.Ctx) error {
		if c.Path() != "/" {
			return c.Redirect("/")
		} else {
			return c.SendString("Sunset error")
		}
	})

	app.Listen(":3000")
}
