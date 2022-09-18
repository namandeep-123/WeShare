import React from "react";
import "../styles/Sell.css";
// import {placeholder} from 'rsuite';        b
function Sell() {
  return (
    <>
      <div className="main-sell">
        <div className="side-left">
          <div className="box-left1">
            <h1 className="margin">Main image</h1>
            <div className="box1 margin">
              <h1>Drag and drop an image here or click to upload.</h1>
            </div>
          </div>
          <div className="box-right1 margin">
            <h1 className="margin">Main image</h1>
            <div className="box1 margin">
              <h1>Drag and drop an image here or click to upload.</h1>
            </div>
          </div>
        </div>
        <div className="right-side">
          <h1>Product Details</h1>
          <div className="rdiv">
            <label>Model</label>
            <input placeholder="P40 Warhawk" type="text"></input>
          </div>
          <div className="rdiv">
            <label>Brand</label>
            <input placeholder="Curtiss" type="text"></input>
          </div>
          <div className="rdiv">
            <label>Year</label>
            <input placeholder="1938" type="text"></input>
          </div>
          <div className="rdiv">
            <label>Price</label>
            <input placeholder="20,00,000" type="text"></input>
          </div>
          <div className="rdiv">
            <label>Registeration</label>
            <input placeholder="1938" type="text"></input>
          </div>
          <div className="rdiv">
            <label>Serial Number</label>
            <input placeholder="2011" type="text"></input>
          </div>
          <div className="rdiv">
            <label>Location</label>
            <input placeholder="Chandigarh" type="text"></input>
          </div>
          <div className="rdiv">
            <label>Description</label>
            <textarea></textarea>
          </div>
          <div className="rdiv">
            <label>Equipment</label>
            <textarea></textarea>
          </div>
          <div className="rdiv">
            <label>Airframe</label>
            <textarea></textarea>
          </div>
        </div>
      </div>
    </>
  );
}
export default Sell;
