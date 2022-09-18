import React from "react";
import "./Services.css";
import anime from "animejs";
import { useEffect } from "react";

const Services = ({ data }) => {
  useEffect(() => {
    ServicesAnimation();
  });
  function readMore(a, b) {
    let message = `${a} - ${b}`;
    alert(message);
  }

  let ServicesAnimation = () => {
    anime({
      targets: ".Services",
      translateX: [-2000, 0],
      direction: "normal",
      easing: "linear",
      delay: 500,
      opacity: [0, 1],
    });
  };

  return (
    <div className="Services">
      {data.map((item, index) => (
        <div className="service-box" key={index}>
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

export default Services;
