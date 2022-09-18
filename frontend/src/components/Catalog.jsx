import React from "react";
import "./Catalog.css";
import anime from "animejs";
import { useEffect } from "react";

const Catalog = ({ data }) => {
  useEffect(() => {
    CatalogAnimation();
  });
  function readMore(a, b) {
    let message = `${a} - ${b}`;
    alert(message);
  }

  let CatalogAnimation = () => {
    anime({
      targets: ".Catalog",
      translateX: [-2000, 0],
      direction: "normal",
      easing: "linear",
      delay: 500,
      opacity: [0, 1],
    });
  };

  return (
    <div className="Catalog">
      {data.map((item, index) => (
        <div className="box" key={index}>
          <img src={item.img} alt="" />
          <h3>{item.title}</h3>
          <p>{item.content}</p>
          <a
            href={item.link}
            className="btn"
            onClick={() => readMore(item.title, item.content)}
          >
            {item.button}
          </a>
        </div>
      ))}
    </div>
  );
};

export default Catalog;
