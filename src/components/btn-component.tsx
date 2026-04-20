import { useEffect } from "react";

function BtnComponent(props: any) {
    const soyHi = () => {
        console.log('Button clicked!');
    }
    return (
        <button className="btn btn-primary" onClick={() => soyHi()}>
            Click me {props.hi}
        </button>
    );
}

export default BtnComponent;