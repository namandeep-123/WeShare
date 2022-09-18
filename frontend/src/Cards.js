import React from "react";
function Cards(props) {
  return (
    
      <div class="card">
        <img
          src={props.image}
          alt=""
        />
        <div class="card-body">
          <div class="row">
            <div class="card-title">
              <h4>{props.name}</h4>
              <h3>$120</h3>
            </div>
            <div class="view-btn">
              <a href="">View Details</a>
            </div>
          </div>
          <hr />
          <p>
            Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi,
            dignissimos.
          </p>
          <div class="btn-group">
            <div class="btn">
              <a href="">Buy Now</a>
            </div>
            <a href=""> Cancel</a>
          </div>
        </div>
      </div>
    
  );
}
export default Cards;
