<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="POS">
    <section id="the-html-sect">
        <div class="hero__description">
            <h1>Welcome to our shop</h1>
            <a href="#">Products</a>
        </div>
        <video class="video" autoplay="" preload="" muted="" loop="" playsinline=""
               style="object-fit: cover; object-position: 50% 50%;">
            <source src="https://images.all-free-download.com/footage_preview/mp4/fresh_vegetables_sale_on_market_6891854.mp4"
                    type="video/mp4">
        </video>
    </section>
</t:pageTemplate>

<style>
    .video {
        width: 100%;
        height: 100%;
        position: fixed;
        top: 0;
        left: 0;
        z-index: 999;
    }

    .hero__description {
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;


        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        text-align: center;
        z-index: 1000;
        width: 100%;
        height: 100%;
        background-color: rgba(155, 155, 155, 0.5);
    }
</style>