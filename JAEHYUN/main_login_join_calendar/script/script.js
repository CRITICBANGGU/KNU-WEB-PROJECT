const toggleBtn = document.querySelector('.navbar_toogleBtn');
const menu = document.querySelector('.head_navbar');

toggleBtn.addEventListener('click',()=>{
    menu.classList.toggle('active');
})