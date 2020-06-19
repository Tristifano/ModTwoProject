// Code your solution here
document.addEventListener("DOMContentLoaded", ()=> {
getShoes()

})

const getShoes = () => {
    fetch('http://localhost:3000/shoes')
    .then(resp => resp.json())
    .then(shoesArr => {
        let shoesUl = document.getElementById('shoe-list')
        shoesArr.forEach(shoe => {
            let shoeLi = document.createElement('li')
            shoeLi.innerText = shoe.name
            addLiListener(shoeLi,shoe)
            shoesUl.append(shoeLi)
        })
    })
}

const addLiListener = (li,shoe) => {
    li.addEventListener("click",() => {
        showShoe(shoe)
    })
}

const showShoe = (shoe) => {
    let image = document.getElementById('shoe-image'),
        name = document.getElementById('shoe-name'),
        description = document.getElementById('shoe-description'),
        price = document.getElementById('shoe-price')
    image.src = shoe.image, name.innerText = shoe.name, description.innerText = shoe.description, price.innerText = shoe.price
    createForm()
    addFormListener(shoe)
    renderReviews(shoe)
    
}

const createForm = () => {
    let container = document.getElementById('form-container')
    container.innerHTML = `<form id="new-review">
    <div class="form-group">
      <textarea class="form-control" id="review-content" rows="3"></textarea>
      <input type="submit" class="btn btn-primary"></input>
    </div>
  </form>`
}

const addFormListener = (shoe) => {
    document.getElementById('new-review').addEventListener("submit",(form) => {
        form.preventDefault()
        let content = form.target['review-content'].value
        addReview(content,shoe)
    })
}

const renderReviews = (shoe) => {
    let reviewsUl = document.getElementById('reviews-list')
    shoe.reviews.forEach(review => {
        let reviewLi = document.createElement('li')
        reviewLi.class = 'list-group-item'
        reviewLi.innerText = review.content
        reviewsUl.append(reviewLi)
    })
}

const addReview = (content,shoe) => {
    let newShoe = {...shoe}
    fetch(`http://localhost:3000/shoes/${shoe.id}/reviews`, {
        method: 'POST',
        headers: {
            'content-type':'application/json'
        },
        body: JSON.stringify({
            content: content
        })
    })
    .then(resp => resp.json())
    .then(review => {
        console.log(review);
        console.log(shoe)
        newShoe.reviews.push(review)
        document.getElementById('new-review').reset()
        clearReviews()
        renderReviews(newShoe)
    })
}

const clearReviews = () => {
    let ul = document.getElementById('reviews-list')
    while(ul.firstChild) {
        ul.removeChild(ul.firstChild)
    }
}