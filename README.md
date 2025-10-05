# Fueled Flutter Assignment - Submission

Hello, thank you for the assignment.

The solution was a bit too big, so I am not able to raise a PR for it
*(GitHub only allows 3000 files in a PR)*

![Clean Architecture Flowchart for Flutter Photo App](https://ppl-ai-code-interpreter-files.s3.amazonaws.com/web/direct-files/65849d9ebb1a109c836da70cf80db6cf/681e768a-7522-41a2-83ae-60c860d0922f/2c5673b4.png)

---

## What were your priorities, and why?

My main priorities were:

- **Clean Architecture:** I focused on clear separation between data, domain, and presentation layers to make this app scalable and maintainable. It is also much easier to read and understand what is happening now than before.

-  To keep business logic isolated and abstract away external services, I implemented domain use cases and repositories.

-  I ensured `HomeBloc` properly handled loading, data, and error states with streams, making the UI react efficiently. I also utilized `flutter_bloc` for this.

-  I wrote unit tests for use cases, repositories, and bloc to ensure correctness and ease of future refactoring.

- I built on top of the extensible navigation system with `GoRouter` and a custom route provider abstraction for clean routing.

---

## If you had another two days, what would you have tackled next?

- Improve the detailed design of screens, making the UI more polished.

- Integrate a local persistence layer or caching (e.g., Hive or SQLite) to enable showing images offline.

- Add widget and integration tests for user flows.

- Provide retry buttons and tailored error messages for improved UX.

- Analyze and mitigate UI jank or over-fetching, avoiding repeated requests when no server data has changed.

---

## What would you change about the structure of the code?

- Introduce dedicated **domain** folders inside each feature for entities, repositories, and use cases to improve layer clarity.

- Separate the **core** module into multiple well-defined packages like `network`, `di`, and `extensions`.

- Establish consistent naming conventions across file and class names for better maintainability.

- Modularize features more granularly, e.g., splitting `photos` into smaller sub-features for better scalability.

- Make reusable components and folders plug-and-play to facilitate white-label app builds or multi-project usage.

---

## What bugs did you find but not fix?

- Minor UI glitches where empty states do not always show as expected.

- Potential race conditions if the bloc is disposed during an ongoing fetch request.

- Edge cases related to canceling API requests were not fully handled.

- Some navigation issues when deep-linking or restoring app state.

---

## What would you change about the visual design of the app?

- Use a more consistent color palette and typography scaled with spacing guidelines.

- Add animations and smooth transitions for loading and navigation, extending beyond basic hero animations.

- Improve photo layout responsiveness on different screen sizes and orientations.

- Add placeholders for loading images and structured error views for better UX.

- Consider adding dark theme support for accessibility and user preference.

---

## How long did you spend on this project (approximately)?

Approximately 3.5 hours over the weekend, including architecture setup, feature development, navigation, and writing tests. I used minimal AI help to fix couple of small issues and speed up the DI process, you can find comments in code wherever this has been used

---

Thank you for considering my submission. Please feel free to reach out if you would like me to elaborate on any part or provide a demo.
