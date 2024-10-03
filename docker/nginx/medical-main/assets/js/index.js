// Show nav-menu
const menu = document.getElementById("nav-menu");
const close = document.getElementById("nav-close");
const toggle = document.getElementById("nav-toggle");

const showMenu = () => {
  menu.classList.toggle("show-menu");
};

close.addEventListener("click", showMenu);
toggle.addEventListener("click", showMenu);

// background header when scroll
const bgHeader = () => {
  const header = document.getElementById("header");

  this.scrollY >= 80
    ? header.classList.add("bg-header")
    : header.classList.remove("bg-header");
};

window.addEventListener("scroll", bgHeader);

// Doctors more-btn
const moreBtn = document.getElementById("more-btn");

let currentItem = 3;
let showingMore = true;

const toggleCards = () => {
  let cards = [...document.querySelectorAll(".doctors__card")];

  if (showingMore) {
    for (let i = currentItem; i < currentItem + 3 && i < cards.length; i++) {
      cards[i].style.display = "block";
    }
    currentItem += 3;

    if (currentItem >= cards.length) {
      moreBtn.innerText = "Less";
      showingMore = false;
    }
  } else {
    for (let i = currentItem - 3; i < cards.length; i++) {
      cards[i].style.display = "none";
    }
    currentItem -= 3;

    if (currentItem <= 3) {
      currentItem = 3;
      moreBtn.innerText = "More";
      showingMore = true;
    }
  }
};

moreBtn.addEventListener("click", toggleCards);

toggleCards();

// Show scrollup
const scrollup = () => {
  const scrollup = document.getElementById("scroll-up");

  this.scrollY >= 250
    ? scrollup.classList.add("show-scroll")
    : scrollup.classList.remove("show-scroll");
};

window.addEventListener("scroll", scrollup);
// Scroll active nav__link
// Scroll active-link
const sections = document.querySelectorAll('section[id]')
    
const scrollActive = () =>{
  	const scrollDown = window.scrollY

	sections.forEach(current =>{
		const sectionHeight = current.offsetHeight,
			  sectionTop = current.offsetTop - 58,
			  sectionId = current.getAttribute('id'),
			  sectionsClass = document.querySelector('.nav__menu a[href*=' + sectionId + ']')

		if(scrollDown > sectionTop && scrollDown <= sectionTop + sectionHeight){
			sectionsClass.classList.add('active')
		}else{
			sectionsClass.classList.remove('active')
		}                                                    
	})
}
window.addEventListener('scroll', scrollActive)
