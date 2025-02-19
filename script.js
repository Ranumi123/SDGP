// Main initialization function
document.addEventListener('DOMContentLoaded', initializePage);

function initializePage() {
    // Initialize AOS animation library
    if (typeof AOS !== 'undefined') {
        AOS.init({
            duration: 800,
            once: true,
            offset: 100
        });
    }

    // Initialize all components
    initScrollAnimations();
    initHeaderEffects();
    initMobileMenu();
    initSmoothScrolling();
    initCTAButtons();
    initFeatureCards();
    initScrollToTopButton();
    initHeroEffects();
    initStatCounters();
    initTestimonials();
    initParticleEffects();
}

// SCROLL ANIMATIONS
function initScrollAnimations() {
    const scrollElements = document.querySelectorAll('.step, .feature-card');
    
    scrollElements.forEach(element => {
        element.classList.add('fade-in');
    });
    
    const handleScrollAnimation = () => {
        scrollElements.forEach((el) => {
            if (isElementInViewport(el)) {
                el.classList.add('active');
            }
        });
    };
    
    window.addEventListener('scroll', handleScrollAnimation);
    handleScrollAnimation(); // Initial check on load
    
    // Float animation for shapes
    const shapes = document.querySelectorAll('.shape');
    shapes.forEach((shape, index) => {
        shape.style.animationDelay = `${index * 0.2}s`;
    });
    
    // Hero content fade in
    setTimeout(() => {
        const heroContent = document.querySelector('.hero-content');
        if (heroContent) {
            heroContent.style.opacity = 1;
            heroContent.style.transform = 'translateY(0)';
        }
    }, 200);
}

// HEADER EFFECTS
function initHeaderEffects() {
    const header = document.getElementById('header');
    if (!header) return;
    
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
}

// MOBILE MENU
function initMobileMenu() {
    const mobileMenuButton = document.getElementById('mobileMenu');
    const navLinks = document.getElementById('navLinks');
    if (!mobileMenuButton || !navLinks) return;
    
    mobileMenuButton.addEventListener('click', () => {
        navLinks.classList.toggle('active');
        
        const icon = mobileMenuButton.querySelector('i');
        if (icon) {
            if (navLinks.classList.contains('active')) {
                icon.classList.remove('fa-bars');
                icon.classList.add('fa-times');
            } else {
                icon.classList.remove('fa-times');
                icon.classList.add('fa-bars');
            }
        }
    });
}

// SMOOTH SCROLLING
function initSmoothScrolling() {
    const navLinks = document.getElementById('navLinks');
    const mobileMenuButton = document.getElementById('mobileMenu');
    
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            
            const targetId = this.getAttribute('href');
            const targetElement = targetId.startsWith('#') ? 
                document.getElementById(targetId.substring(1)) : 
                document.querySelector(targetId);
            
            if (targetElement) {
                // Close mobile menu if open
                if (navLinks && navLinks.classList.contains('active')) {
                    navLinks.classList.remove('active');
                    if (mobileMenuButton) {
                        const icon = mobileMenuButton.querySelector('i');
                        if (icon) {
                            icon.classList.remove('fa-times');
                            icon.classList.add('fa-bars');
                        }
                    }
                }
                
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });
}

// CTA BUTTONS
function initCTAButtons() {
    const ctaButtons = document.querySelectorAll('.cta-button, .cta-button-light');
    
    ctaButtons.forEach(button => {
        button.addEventListener('click', () => {
            alert('Taking you to download MindBridge app!');
            // In production, replace with actual app store links or download logic
        });
        
        // Add gradient hover effect for primary CTA buttons
        if (button.classList.contains('cta-button')) {
            button.addEventListener('mouseenter', (e) => {
                const rect = button.getBoundingClientRect();
                const x = e.clientX - rect.left;
                const y = e.clientY - rect.top;
                
                button.style.background = `radial-gradient(circle at ${x}px ${y}px, var(--secondary) 0%, var(--primary) 50%)`;
            });
            
            button.addEventListener('mouseleave', () => {
                button.style.background = 'var(--primary)';
            });
        }
    });
}

// FEATURE CARDS
function initFeatureCards() {
    const featureCards = document.querySelectorAll('.feature-card');
    
    featureCards.forEach(card => {
        // Simple hover effect
        card.addEventListener('mouseenter', () => {
            card.style.transform = 'translateY(-10px)';
            card.style.boxShadow = '0 10px 30px rgba(106, 90, 205, 0.15)';
        });
        
        card.addEventListener('mouseleave', () => {
            card.style.transform = '';
            card.style.boxShadow = '';
            card.style.transition = 'transform 0.5s ease';
        });
        
        // Advanced tilt effect
        card.addEventListener('mousemove', (e) => {
            const rect = card.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;
            
            const centerX = rect.width / 2;
            const centerY = rect.height / 2;
            
            const rotateX = (y - centerY) / 25;
            const rotateY = (centerX - x) / 25;
            
            card.style.transform = `perspective(1000px) rotateX(${rotateX}deg) rotateY(${rotateY}deg) scale3d(1.05, 1.05, 1.05)`;
        });
    });
}

// SCROLL TO TOP BUTTON
function initScrollToTopButton() {
    // Check if button already exists
    if (document.querySelector('.scroll-top')) return;
    
    const scrollTopButton = document.createElement('button');
    scrollTopButton.innerHTML = '<i class="fas fa-arrow-up"></i>';
    scrollTopButton.classList.add('scroll-top');
    scrollTopButton.style.display = 'none';
    document.body.appendChild(scrollTopButton);
    
    // Style the scroll button (move to CSS in production)
    applyScrollButtonStyles(scrollTopButton);
    
    // Show/hide scroll button based on scroll position
    window.addEventListener('scroll', () => {
        if (window.scrollY > 500) {
            scrollTopButton.style.display = 'block';
            scrollTopButton.style.opacity = '1';
        } else {
            scrollTopButton.style.opacity = '0';
            setTimeout(() => {
                if (window.scrollY <= 500) {
                    scrollTopButton.style.display = 'none';
                }
            }, 300);
        }
    });
    
    // Scroll to top when button is clicked
    scrollTopButton.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
    
    // Hover effects
    scrollTopButton.addEventListener('mouseenter', () => {
        scrollTopButton.style.backgroundColor = 'var(--secondary)';
        scrollTopButton.style.transform = 'translateY(-3px)';
        scrollTopButton.style.boxShadow = '0 5px 15px rgba(106, 90, 205, 0.4)';
    });
    
    scrollTopButton.addEventListener('mouseleave', () => {
        scrollTopButton.style.backgroundColor = 'var(--primary)';
        scrollTopButton.style.transform = '';
        scrollTopButton.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.2)';
    });
}

// HERO EFFECTS
function initHeroEffects() {
    const hero = document.querySelector('.hero');
    const shapes = document.querySelectorAll('.shape');
    if (!hero) return;
    
    // Parallax effect
    window.addEventListener('scroll', () => {
        const scrollY = window.scrollY;
        
        if (scrollY < window.innerHeight) {
            // Parallax for shapes
            shapes.forEach((shape, index) => {
                const speed = 0.1 + (index * 0.05);
                shape.style.transform = `translateY(${scrollY * speed}px)`;
            });
            
            // Parallax for hero background
            hero.style.backgroundPosition = `center ${scrollY * 0.2}px`;
        }
    });
    
    // Mouse movement effect
    hero.addEventListener('mousemove', (e) => {
        const { clientX, clientY } = e;
        const centerX = window.innerWidth / 2;
        const centerY = window.innerHeight / 2;
        
        shapes.forEach((shape, index) => {
            const speed = 0.01 + (index * 0.005);
            const x = (clientX - centerX) * speed;
            const y = (clientY - centerY) * speed;
            
            shape.style.transform = `translate(${x}px, ${y}px)`;
        });
    });
    
    // Typing effect
    initTypingEffect();
}

// TESTIMONIALS
function initTestimonials() {
    const testimonialSlides = document.querySelectorAll('.testimonial-slide');
    const testimonialDots = document.querySelectorAll('.testimonial-dot');
    if (testimonialSlides.length === 0 || testimonialDots.length === 0) return;
    
    let currentSlide = 0;
    let slideInterval;
    
    function showSlide(index) {
        // Hide all slides
        testimonialSlides.forEach(slide => {
            slide.classList.remove('active');
            slide.hidden = true;
        });
        
        // Deactivate all dots
        testimonialDots.forEach(dot => {
            dot.classList.remove('active');
            dot.setAttribute('aria-selected', 'false');
        });
        
        // Show the active slide and dot
        testimonialSlides[index].classList.add('active');
        testimonialSlides[index].hidden = false;
        testimonialDots[index].classList.add('active');
        testimonialDots[index].setAttribute('aria-selected', 'true');
        
        // Add fade in animation
        testimonialSlides[index].style.animation = 'fadeIn 0.5s ease-out';
    }
    
    // Start auto-advance
    function startAutoAdvance() {
        slideInterval = setInterval(autoAdvance, 5000);
    }
    
    function autoAdvance() {
        currentSlide = (currentSlide + 1) % testimonialSlides.length;
        showSlide(currentSlide);
    }
    
    // Add click event to dots
    testimonialDots.forEach((dot, index) => {
        dot.addEventListener('click', () => {
            currentSlide = index;
            showSlide(currentSlide);
            
            // Reset timer
            clearInterval(slideInterval);
            setTimeout(startAutoAdvance, 10000);
        });
    });
    
    // Initial slide show and start auto-advance
    showSlide(0);
    startAutoAdvance();
}

// UTILITY FUNCTIONS
function isElementInViewport(el) {
    const rect = el.getBoundingClientRect();
    return (
        rect.top <= (window.innerHeight || document.documentElement.clientHeight) * 0.8
    );
}

function applyScrollButtonStyles(button) {
    const styles = {
        position: 'fixed',
        bottom: '20px',
        right: '20px',
        backgroundColor: 'var(--primary)',
        color: 'white',
        width: '50px',
        height: '50px',
        borderRadius: '50%',
        border: 'none',
        cursor: 'pointer',
        boxShadow: '0 2px 10px rgba(0, 0, 0, 0.2)',
        transition: 'all 0.3s ease',
        zIndex: '999'
    };
    
    Object.assign(button.style, styles);
}

function initTypingEffect() {
    const heroTitle = document.querySelector('.hero-title');
    if (!heroTitle) return;
    
    const originalText = heroTitle.textContent;
    heroTitle.textContent = '';
    
    function typeWriter(text, index) {
        if (index < text.length) {
            heroTitle.textContent += text.charAt(index);
            setTimeout(() => {
                typeWriter(text, index + 1);
            }, 100);
        }
    }
    
    setTimeout(() => {
        typeWriter(originalText, 0);
    }, 500);
}

// STAT COUNTERS
function initStatCounters() {
    createStatsContainer();
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                animateValue('userCount', 0, 150000, 2000);
                animateValue('conversationCount', 0, 3500000, 2000);
                animateValue('supportCount', 0, 500000, 2000);
                observer.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });
    
    const footerInfo = document.querySelector('.footer-info');
    if (footerInfo) {
        observer.observe(footerInfo);
    }
}

function animateValue(elementId, start, end, duration) {
    const obj = document.getElementById(elementId);
    if (!obj) return;
    
    let startTimestamp = null;
    const step = (timestamp) => {
        if (!startTimestamp) startTimestamp = timestamp;
        const progress = Math.min((timestamp - startTimestamp) / duration, 1);
        obj.innerHTML = Math.floor(progress * (end - start) + start).toLocaleString();
        if (progress < 1) {
            window.requestAnimationFrame(step);
        }
    };
    window.requestAnimationFrame(step);
}

function createStatsContainer() {
    const footerInfo = document.querySelector('.footer-info');
    if (!footerInfo) return;
    
    // Check if stats already exist
    if (document.querySelector('.stats-container')) return;
    
    const statsDiv = document.createElement('div');
    statsDiv.classList.add('stats-container');
    statsDiv.innerHTML = `
        <div class="stat">
            <div class="stat-number" id="userCount">0</div>
            <div class="stat-label">Active Users</div>
        </div>
        <div class="stat">
            <div class="stat-number" id="conversationCount">0</div>
            <div class="stat-label">AI Conversations</div>
        </div>
        <div class="stat">
            <div class="stat-number" id="supportCount">0</div>
            <div class="stat-label">Support Sessions</div>
        </div>
    `;
    
    // Add stats styles if not already in document
    if (!document.querySelector('style[data-stats-style]')) {
        const style = document.createElement('style');
        style.setAttribute('data-stats-style', true);
        style.textContent = `
            .stats-container {
                display: flex;
                justify-content: space-between;
                margin-top: 30px;
                text-align: center;
            }
            
            .stat {
                flex: 1;
            }
            
            .stat-number {
                font-size: 24px;
                font-weight: 700;
                color: var(--accent);
                margin-bottom: 8px;
            }
            
            .stat-label {
                font-size: 14px;
                opacity: 0.7;
            }
            
            @media (max-width: 768px) {
                .stats-container {
                    flex-direction: column;
                    gap: 20px;
                }
            }
        `;
        document.head.appendChild(style);
    }
    
    footerInfo.appendChild(statsDiv);
}

// PARTICLE EFFECTS
function initParticleEffects() {
    const ctaSection = document.querySelector('.cta');
    if (!ctaSection) return;
    
    // Check if particles already exist
    if (ctaSection.querySelector('.particles-container')) return;
    
    const particleContainer = document.createElement('div');
    particleContainer.classList.add('particles-container');
    ctaSection.appendChild(particleContainer);
    
    // Add particle styles if not already in document
    if (!document.querySelector('style[data-particle-style]')) {
        const particleStyle = document.createElement('style');
        particleStyle.setAttribute('data-particle-style', true);
        particleStyle.textContent = `
            .particles-container {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                overflow: hidden;
                z-index: 1;
            }
            
            .particle {
                position: absolute;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.3);
                pointer-events: none;
            }
            
            .cta .container {
                position: relative;
                z-index: 2;
            }
            
            @keyframes float {
                0%, 100% {
                    transform: translateY(0) translateX(0);
                }
                25% {
                    transform: translateY(-20px) translateX(10px);
                }
                50% {
                    transform: translateY(-10px) translateX(-15px);
                }
                75% {
                    transform: translateY(-25px) translateX(5px);
                }
            }
        `;
        document.head.appendChild(particleStyle);
    }
    
    // Create particles
    createParticles(particleContainer, 50);
}

function createParticles(container, count) {
    for (let i = 0; i < count; i++) {
        const size = Math.random() * 6 + 1;
        const particle = document.createElement('div');
        particle.classList.add('particle');
        
        // Random position and opacity
        const posX = Math.random() * 100;
        const posY = Math.random() * 100;
        const opacity = Math.random() * 0.5 + 0.1;
        
        // Set styles
        particle.style.width = `${size}px`;
        particle.style.height = `${size}px`;
        particle.style.left = `${posX}%`;
        particle.style.top = `${posY}%`;
        particle.style.opacity = opacity;
        
        // Set animation
        const duration = Math.random() * 20 + 10;
        const delay = Math.random() * 5;
        particle.style.animation = `float ${duration}s infinite ease-in-out ${delay}s`;
        
        container.appendChild(particle);
    }
}