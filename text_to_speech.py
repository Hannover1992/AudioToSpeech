from openai import OpenAI
client = OpenAI()
import os


def transcribe_audio( audio_path):
    with open(audio_path, "rb") as audio_file:
        transcript = client.audio.transcriptions.create(
          model="whisper-1", 
          file=audio_file, 
          response_format="text"
        )
    return transcript

def main():
    # Path to the directory containing audio chunks
    chunks_dir = './chunks/'

    # Open the file to append the results
    with open('results.txt', 'w') as results_file:
        # Process each chunk
        for chunk_file in sorted(os.listdir(chunks_dir)):
            if chunk_file.endswith('.mp3'):
                print(f"Processing {chunk_file}...")
                chunk_path = os.path.join(chunks_dir, chunk_file)
                transcribed_text = transcribe_audio(chunk_path)
                results_file.write(transcribed_text + "\n")

if __name__ == "__main__":
    main()
