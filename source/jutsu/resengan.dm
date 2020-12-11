mob
	proc
		PushEnemy(mob/enemy/e, tileOffset, pixelOffset)
			var/static/step = 0 			// How far we have moved (not in pixels).
			var/static/pixel_step = 0		// How far we have moved in pixels.
			e.canMove = 0					// We don't want the enemy to move while their being pushed.

			pixel_step += pixelOffset		// Update the amount of pixel movement.

			// Here you should check the tile offset. If we only want to move the player
			// by 1 tile then this is pretty pointless. If we want to move the player
			// more than 1 tile, then we'll have something really interesting going on.
			if (tileOffset == 1)
				step++
			else if(32 - pixel_step <= 0)
				step++
				pixel_step = 0

			// Here we'll just wait 1/10 of a second before we call the function again. Also,
			// we base the movement of the enemy from our direction.
			spawn(1)
				if (step != tileOffset)
					switch (src.dir)
						if (NORTH)
							e.pixel_y += pixelOffset
						if (SOUTH)
							e.pixel_y -= pixelOffset
						if (EAST)
							e.pixel_x += pixelOffset
						if (WEST)
							e.pixel_x -= pixelOffset
					PushEnemy(e, tileOffset, pixelOffset)
				else
					switch (src.dir)
						if (NORTH)
							e.loc = locate(e.loc.x, e.loc.y+step, 1)
						if (SOUTH)
							e.loc = locate(e.loc.x, e.loc.y-step, 1)
						if (EAST)
							e.loc = locate(e.loc.x+step, e.loc.y, 1)
						if (WEST)
							e.loc = locate(e.loc.x-step, e.loc.y, 1)

					// We want to reset these variables. The pixel_x and pixel_y distort the
					// location of the character and we want to make sure we set them back to 0.
					// Furthermore we want to set step and pixel_step back to 0 since they are
					// static variables.
					e.canMove = 1
					e.pixel_x = 0
					e.pixel_y = 0
					step = 0
					pixel_step = 0


	// Yea, I know, you can resengan yourself... should be an easy fix right?