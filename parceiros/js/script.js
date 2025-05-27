// Mobile menu toggle
const mobileMenuButton = document.getElementById('mobile-menu-button');
const mobileMenu = document.getElementById('mobile-menu');
mobileMenuButton.addEventListener('click', () => {
    mobileMenu.classList.toggle('hidden');
});

// Dynamic copyright year
document.getElementById('currentYear').textContent = new Date().getFullYear();

tailwind.config = {
    theme: {
        extend: {
            fontFamily: {
                'roboto': ['Roboto', 'sans-serif'],
                'montserrat': ['Montserrat', 'sans-serif'],
            },
            colors: {
                'asj-blue': {
                    light: '#6B9BEA',
                    DEFAULT: '#3779DD',
                    dark: '#1F55A5',
                },
                'asj-gray': {
                    extralight: '#ECEFF1',
                    light: '#F5F5F5',
                    DEFAULT: '#757575',
                    dark: '#424242',
                    extradark: '#212121',
                }
            },
            animation: {
                'fade-in-down': 'fadeInDown 0.8s ease-out forwards',
                'fade-in-up': 'fadeInUp 0.8s ease-out 0.2s forwards',
            },
            keyframes: {
                fadeInDown: {
                    '0%': { opacity: '0', transform: 'translateY(-20px)' },
                    '100%': { opacity: '1', transform: 'translateY(0)' },
                },
                fadeInUp: {
                    '0%': { opacity: '0', transform: 'translateY(20px)' },
                    '100%': { opacity: '1', transform: 'translateY(0)' },
                }
            }
        }
    }
}