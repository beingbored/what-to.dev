// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.css"

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

function debounce(func, wait, immediate) {
    var timeout;
    return function() {
        var context = this, args = arguments;
        var later = function() {
            timeout = null;
            if (!immediate) func.apply(context, args);
        };
        var callNow = immediate && !timeout;
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
        if (callNow) func.apply(context, args);
    };
};


const updateStatus = debounce((event) => {
    const sentences = event.target.value
        .split('\n')
        .filter(p => p.trim().length >= 1)
    const words = sentences
        .map(sentence => sentence.split(' '))
        .reduce((acc,curr) => acc + curr.length, 0)
    status.innerText = `Sentences: ${sentences.length}, Words: ${words}`
}, 100)

const blogFormPageHandler = ()  => {
    const textarea = document.getElementById('blog-post-body')
    const status = document.getElementById('blog-form-body-status')
    if (!textarea || !status) { return }
    textarea.addEventListener("keyup", updateStatus)
}
const removeBlogFormEvent = () => {
    const textarea = document.getElementById('blog-post-body')
    const status = document.getElementById('blog-form-body-status')
    if (!textarea || !status) { return }
    textarea.removeEventListener("keyup", () => updateStatus)
}

window.addEventListener('DOMContentLoaded', () => {
    if (document.getElementById('blog-new')) {
        blogFormPageHandler();
    } else {
        removeBlogFormEvent();
    }
})