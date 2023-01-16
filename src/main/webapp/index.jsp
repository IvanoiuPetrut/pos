<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:pageTemplate pageTitle="POS">
    <section id="the-html-sect">

        <div class="container-fluid overflow-hidden p-0">
            <div class="row g-0">
                <div class="col-md-6 order-md-2 w-75">
                    <div class="card" lc-helper="video-bg">
                        <video class="min-vh-100" autoplay="" preload="" muted="" loop="" playsinline=""
                               style="object-fit: cover; object-position: 50% 50%;">
                            <!-- adjust object-position to tweak cropping on mobile -->
                            <source src="https://media.istockphoto.com/id/1203031244/ro/video/cump%C4%83r%C4%83turi-%C3%AEn-supermarket.mp4?s=mp4-640x640-is&k=20&c=0_pnssL7-UXNrG7BLnR-2Pr00GPBr3_UhzNc2MZGE54" type="video/mp4">
                        </video>
                    </div>
                </div>
                <div class="col-md-6 order-md-1 my-auto text-center" style="padding:10vw">

                    <div class="lc-block mb-3">
                        <div editable="rich">
                            <h2>Hello World!</h2>
                            <p class="lead">Lorem ipsum dolor sit amet, consectetur adipiscing
                                elit. Nullam tincidunt enim ac augue suscipit rhoncus. Donec ante erat, hendrerit sed
                                eleifend et, dapibus at leo. Mauris bibendum mi ut dui sagittis volutpat. </p>

                        </div>

                    </div>

                    <div class="lc-block">
                        <a class="btn btn-primary" href="#" role="button">Click me, I'm a button</a>
                    </div><!-- /lc-block -->

                </div>
            </div>
        </div>
    </section>
</t:pageTemplate>