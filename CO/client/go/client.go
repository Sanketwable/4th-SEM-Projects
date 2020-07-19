package main

import (
	"fmt"
	"io"
	"log"
	api "recognize/go"

	"golang.org/x/net/context"
	"google.golang.org/grpc"
	"os"
	"time"

	"github.com/faiface/beep/mp3"
	"github.com/faiface/beep/speaker"
)

func main() {
	var conn *grpc.ClientConn

	conn, err := grpc.Dial(":7777", grpc.WithInsecure())
	if err != nil {
		log.Fatalf("did not connect: %s", err)
	}
	defer conn.Close()
	c := api.NewDetectorClient(conn)
	stream, err := c.Detect(context.Background(), &api.DetectorRequest{})
	waitc := make(chan struct{})
	//Keep reading ....
	go func() {
		for {
			in, err := stream.Recv()
			if err == io.EOF {
				fmt.Println("EOF")
				fmt.Println("err has occured")
			}
			// if in.H == 10000 {
			// 	b := playMessage()
			// 	fmt.Printf("distance = %v and sound played = %v",distance,b)
			// 	in.H = 9000
			// }
			playMessage()
			log.Printf("X : %d , Y : %d , W : %d , H : %d \n", in.X, in.Y, in.W, in.H)

			
			
		}
	}()
	<-waitc
	stream.CloseSend()

}

func playMessage() {
	f, err := os.Open("Message.mp3")
	if err != nil {
		log.Fatal(err)
	}

	streamer, format, err := mp3.Decode(f)
	if err != nil {
		log.Fatal(err)
	}
	defer streamer.Close()
	speaker.Init(format.SampleRate, format.SampleRate.N(time.Second/10))
	speaker.Play(streamer)
	time.Sleep(4 * time.Second)
}
