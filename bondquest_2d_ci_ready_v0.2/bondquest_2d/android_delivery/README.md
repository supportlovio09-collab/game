# Google Play on-demand delivery contract

The finished game must be wired into the current Android host as a Play Feature Delivery deferred component.

## Target user flow
1. Host checks whether `bondquest` is installed.
2. User taps **Play BondQuest**.
3. Host requests the on-demand module and shows bytes/progress/retry.
4. After installation, host resolves `createBondQuestGame()` and opens it.
5. Settings can offer **Remove downloaded game**.

## Important integration boundary
A real deferred-component setup changes the host app's `settings.gradle`, Android app bundle modules, Flutter deferred-components configuration, route loading, and Play Console delivery settings. Those files depend on the exact current Flutter/Gradle versions. Do not paste guessed Gradle code into production. Apply this wiring only after receiving the current host project.

## Play Console test path
Use an Android App Bundle and an internal testing track. Sideloaded universal APKs do not accurately test Play on-demand delivery.
