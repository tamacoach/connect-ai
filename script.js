// 마우스 움직임에 따른 배경 반응 효과 (옵션)
document.addEventListener('mousemove', (e) => {
    const mouseX = e.clientX;
    const mouseY = e.clientY;
    
    const hero = document.querySelector('.hero');
    if (hero) {
        const xPercent = (mouseX / window.innerWidth) * 100;
        const yPercent = (mouseY / window.innerHeight) * 100;
        hero.style.background = `radial-gradient(circle at ${xPercent}% ${yPercent}%, rgba(0, 242, 255, 0.08) 0%, transparent 60%)`;
    }
});

console.log("Future Vision System Initialized...");
