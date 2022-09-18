import React from "react";
function Cards(props) {
  return (
    <div className="card1">
      <img src={props.image} alt="" />
      <div className="card1-body">
        <div className="row">
          <div className="card1-title">
            <h4>{props.name}</h4>
            <h3>$120</h3>
          </div>
          <div className="view-btn">
            <a href="">View Details</a>
          </div>
        </div>
        <hr />
        <p>
          Lorem ipsum dolor sit amet, consectetur adipisicing elit. Animi,
          dignissimos.
        </p>
        <div className="btn-group">
          <div className="btn">
            <a href="">Buy Now</a>
          </div>
          <a href=""> Cancel</a>
        </div>
      </div>
    </div>
  );
}
export default Cards;
