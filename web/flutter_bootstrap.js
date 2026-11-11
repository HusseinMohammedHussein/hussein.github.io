{{flutter_js}}
{{flutter_build_config}}

_flutter.loader.load({
  onEntrypointLoaded: async function (engineInitializer) {
    const appRunner = await engineInitializer.initializeEngine();
    await appRunner.runApp();

    const loader = document.getElementById('app-loading');

    if (loader) {
      loader.classList.add('fade-out');

      setTimeout(() => loader.remove(), 300);
    }
  }
});