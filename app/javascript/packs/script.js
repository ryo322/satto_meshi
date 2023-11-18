document.addEventListener("DOMContentLoaded", function() {
    const heading = document.querySelector('#heading');

    const keyframes = {
      opacity: [0, 1],
      transform: ['translateY(50px)', 'translateY(0)'],
    };
    const options = {
      duration: 2000,
      easing: 'ease',
    };

    if (heading) {
      heading.animate(keyframes, options);
    } else {
      console.error("Element with ID 'heading' not found.");
    }
  });

  window.addEventListener('load', () => {
    const loading = document.querySelector('#loading');
    if (loading) {
      loading.classList.add('loaded');
    } else {
      console.error("Element with ID 'loading' not found.");
    }
  });