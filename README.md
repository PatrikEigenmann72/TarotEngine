# TarotEngine

## About

**TarotEngine is a Divination Operating System** — a structured, extensible framework designed for serious Tarot practitioners, students of hermetics, and anyone engaged in symbolic or introspective work. It goes far beyond random card pulls or static keyword lists. TarotEngine treats divination as a living practice, giving you tools to study a deck deeply, document your insights, and build a personal symbolic language over time.

At its core, TarotEngine provides a stable, deck‑agnostic architecture: each Tarot card is anchored to a universal archetype number, allowing different decks (RWS, Thoth, Vampyre, and others) to express their own naming, imagery, and structure while still mapping cleanly to the same underlying identity. This enables advanced features like intelligent shuffling, multi‑card pattern detection, and real‑time access to your own Alchemy, Essence, and Shadow notes during readings.

TarotEngine supports daily practice, journaling, professional reading workflows, voice‑transcribed sessions, and a psychologically informed shuffle mechanism that incorporates context such as the querent’s question, emotional state, date, time, and moon phase. Over time, the engine becomes a personalized divination companion — shaped by your lived experience, your interpretations, and your authentic voice.

## Folder Structure

```
TarotEngine/
├── bin/                                ← Output: packaged .jar files  
├── build/                              ← Compiled .class files from source  
├── lib/                                ← External libraries manually tracked  
├── manifest/                           ← Jar manifest file for Main-Class and classpath  
│   └── MANIFEST.MF                     ← Declares entry point and classpath  
├── scripts/                            ← Cross-platform build tools  
│   ├── compile.cmd                     ← Windows: compiles .java files into /build  
│   ├── compile.sh                      ← Unix: compiles .java files into /build
│   ├── database.sql                    ← ZeroDB script, initializes a minimal database configuration
│   ├── run.cmd                         ← Windows: launches App class with dependencies  
│   ├── run.sh                          ← Unix: launches App class with dependencies  
│   ├── pack.cmd                        ← Windows: creates executable .jar using manifest  
│   └── pack.sh                         ← Unix: creates executable .jar using manifest  
├── src/                                ← Source code directory
│   └── samael/                         ← Samael framework class library
│   |   ├── chronicle/                  ← samael.chronicle libraries 
│   |   |   └── Config.java             ← Config class, runtime configuration
│   |   ├── huginandmunin/              ← samael.huginandmunin libraries
│   |   |   ├── Debug.java              ← Debugging utility debug massage tracking
│   |   |   └── Log.java                ← Logging utility log message tracking
│   |   ├── necronomicon/               ← samael.necronomicon libraries
│   |   |   └── ResourceLoader.java     ← Loading resources from either manifest or files
│   └── tarotengine/                    ← Project-specific source code
│   |   ├── gui/                        ← GUI container for layout, controls, and logging
│   |   └── MainFrame.java              ← Main application window with layout and controls
│   └── App.java                        ← Entry point (default package)  
├── LICENSE                             ← GNU General Public License v3.0  
├── README.md                           ← Project overview and usage instructions  
└── .gitignore                          ← Build hygiene and repo clarity
```

## Author

Hello, my name is **Patrik Eigenmann**. I spent nine years as a software engineer working with Java and C# on server-side backend projects. Along the way, I picked up PHP, HTML, and CSS. Later I pivoted to audio—now I work full-time as a Sound Engineer and production manager for large-scale corporate and private live events.

Even now, I still write software in C and Java, especially GUI applications. It’s a passion I never dropped. Programming helps me reflect, learn, and structure my thoughts about how the world works. Most of my projects come from real-world needs.

If you find this project useful, consider donating a few bucks via [PayPal](mailto:p.eigenmann@gmx.net). I appreciate every small contribution—it encourages me to keep developing practical, usable tools that solve real problems.

Thanks for checking out my repo. I hope it helps you.

## License

This project is licensed under the [GNU GPL v3.0](https://www.gnu.org/licenses/gpl-3.0.txt). Feel free to explore, modify, and use responsibly.
