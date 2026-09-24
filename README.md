# DX-Ball — Build & Run

## 1. Requirements
- A C compiler (`gcc`)
- raylib installed on your system (headers + library). If you don't have it yet:
  - **Linux (Debian/Ubuntu):** `sudo apt install libraylib-dev` (or build raylib from source)
  - **macOS:** `brew install raylib`
  - **Windows:** install raylib via [MSYS2](https://www.raylib.com/) or w64devkit (the raylib site has a one-click installer for Windows)

## 2. Build
From this folder (the one containing `dxball_game.c`, `Makefile`, and `resources/`):

```
make
```

This produces `./dxball` (or `dxball.exe` on Windows). If `make`/raylib isn't set up the way the Makefile expects, compile directly, e.g. on Linux:

```
gcc dxball_game.c -o dxball -lraylib -lm -ldl -lpthread -lGL -lrt -lX11
```

or on Windows (MinGW):

```
gcc dxball_game.c -o dxball.exe -lraylib -lopengl32 -lgdi32 -lwinmm
```

## 3. Run
Run the executable **from this same folder** (it loads everything as `resources/...`):

```
./dxball
```

**Important:** keep `dxball` (or `dxball.exe`) sitting next to the `resources/` folder — the game won't find its images/audio if you move just the executable somewhere else.

## 4. Controls
- **Menu / High Scores / Game Over / Win screens:** `UP` / `DOWN` to select, `ENTER` to confirm
- **Name entry:** type, `BACKSPACE` to correct, `ENTER` to confirm
- **Gameplay:** `LEFT`/`RIGHT` (or `A`/`D`) to move the paddle, `SPACE` to launch the ball

---

## What's inside `resources/` and why

I didn't have real named files for `menu_bg.png`, `soothing_bg.mp3`, etc. — you uploaded a batch of actual images/audio instead, so I picked the closest fit for each required slot and renamed them. Here's the exact mapping, so you can swap anything out later:

| Game asset | Built from your upload |
|---|---|
| `menu_bg.png` | `ChatGPT_Image_Sep_9…11_12_46_PM.png` (blue-toned brick/spotlight), cropped to 1280×720 |
| `offwhite_bg.png` | `ChatGPT_Image_Sep_9…11_42_32_PM.png` (cream wave texture), cropped to 1280×720 |
| `menu_bgm.mp3` | `moodmode-retro-game-arcade-236133.mp3` |
| `soothing_bg.mp3` | `suitedfrogds-8-bit-chiptune-2-400593.mp3` |
| `chere_de_ma.mp3` | `BUET_e_porbo_na...mp3` |
| `hapi_hapi.mp3` | `happi_happi_happi...mp3` |
| `sfx_brick_break.wav` | `krnbeatz-8-bit-retro-coin-584191.mp3` (converted to .wav) |
| `sfx_paddle_hit.wav` | `47313572-experimental-8-bit-sound-270302.mp3` (converted to .wav) |
| `sfx_wall_hit.wav` | `freesound_community-ping-82822.mp3` (converted to .wav) |
| `sfx_lose.wav` | `make_more_sound-8-bit-video-game-lose-sound...mp3` (converted to .wav) |
| `sfx_win_fanfare.wav` *(bonus)* | `emand_edroff-victory-bell-success-fanfare-576275.mp3` — plays once on the WIN screen |
| `sfx_confirm.wav` *(bonus)* | first ~0.5s of `voicebosch-menu-select-button-182476.mp3` — plays on menu/UI confirms |

**Not used** (didn't have a clear fit — swap in if you want them):
- `u_688uhtkpjp-8bit-spinning-wheel-sfx-330980.mp3` — no obvious slot in the current design
- The two duplicate grey-brick PNGs (`11_42_51_PM` / `11_42_53_PM` are byte-identical to each other)
- `Untitled_partial.mp4` — this is a clip of a live music/guitar performance, not a game asset, so I left it out. Let me know if you actually meant to include something from it.

## 5. Notes on this build
- I don't have raylib or network access in my sandbox, so I couldn't compile this against the real library end-to-end. I did syntax/type-check the whole file (braces, function signatures, struct usage) against a stub matching raylib's real API, and it's clean — but please compile it on your machine and tell me if anything trips up your specific raylib version, and I'll fix it fast.
- Background/music/SFX logic, states, and high scores all follow your spec (see comments at the top of `dxball_game.c` for the full state-flow diagram).
